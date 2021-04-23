// main.c -- Defines the C-code kernel entry point, calls initialisation routines.
// Made for JamesM's tutorials

#include "monitor.h"
#include "descriptor_tables.h"
#include "paging.h"

int main(struct multiboot *mboot_ptr)
{
    // Initialise all the ISRs and segmentation
    init_descriptor_tables();
    // Initialise the screen (by clearing it)
    monitor_clear();
    monitor_write("Init paging...\n");
    initialise_paging();
    monitor_write("Hello, paging world!\n");

    return 0x0;
}