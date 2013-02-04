From: Dimitrios Siganos <dimitris@siganos.org>
Date: Mon, 04 Feb 2013 21:52:03 +0100
Subject: [Buildroot] Wireless config tool
In-Reply-To: <CAN_xxrXSRK6-DPKkC+8UAVAWQQExVkgGPk4vvPWfMs_DsnJ2ng@mail.gmail.com>
References: <CAN_xxrXSRK6-DPKkC+8UAVAWQQExVkgGPk4vvPWfMs_DsnJ2ng@mail.gmail.com>
Message-ID: <51101F73.1040101@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 18:17, Stephen Turner wrote:
> My current question is if im using a mobile device that will be 
> connecting to various wifi hotspots i will need to be able to setup 
> wifi connections easily from a gui. currently with buildroot i only 
> see the option to manually edit configs to set up hotspots. Is there a 
> tool im overlooking currently in buildroot to help with this setup or 
> will i need to manually add one in? Im looking for something similiar 
> to wicd or how a android device would manage wifi connections.

Hi Stephen,

I am not aware of a simple answer to your question. The major options are:

* network-manager
* wicd
* connman

Network manager is a gnome project and it does expect rather a lot of 
desktop support. It's possible but not simple.

Wicd I don't know much about but it sounds like you do and it won't do.

Connman is a new framework that is targeted to the embedded space so 
that is your best bet. I have never used it myself and don't know any 
details about it.

Other notes:
* openwrt have a web server driven configuration interface that you 
might want to look at
* Android do their own thing (don't have more details)

Questions:
What kind of graphical environemwnt do you have?
What kind of Wifi network do you want to connect to? (open, wpa 
personal, wpa enterprise)

Regards,
Dimitris
