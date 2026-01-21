# HP LaserJet Pro MFP M126a
sudo pacman -S cups system-config-printer hplip ghostscript
sudo systemctl enable --now cups
sudo systemctl status cups

# media:
    Legal(8.5x14 inches, or 216x356mm)
    A4(8.27x11.69 inches, or 210x297mm)
    Letter(8.5x11 inches, or 216x279mm)
    COM10(9.5x4.125 inches, or 241x105mm)
    DL(8.66x4.33 inches, or 220x110mm)
    Custom.WIDTHxLENGTH
    ,Transparency (Transparency media type or source)
    ,Upper (Upper paper tray)
    ,Lower (Lower paper tray)
    ,MultiPurpose (Multi-purpose paper tray)
    ,LargeCapacity (Large capacity paper tray)
# landscape or portrait
# sides:
    one-sided
    two-sided-long-edge
    two-sided-short-edge
# job-sheets:
    none (Do not produce a banner page.)
    classified (A banner page with a "classified" label at the top and bottom.)
    confidential (A banner page with a "confidential" label at the top and bottom.)
    secret (A banner page with a "secret" label at the top and bottom.)
    standard (A banner page with no label at the top and bottom.)
    topsecret (A banner page with a "top secret" label at the top and bottom.)
    unclassified (A banner page with an "unclassified" label at the top and bottom.)

lp -n 1 -o portrait -o media=Letter -o page-ranges=1-4,7,9-12 main.pdf
lp -o media=Custom.220x290mm -o page-ranges=8 main.pdf

lpq
lprm 10
