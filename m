From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Feb 2013 20:33:43 +0200
Subject: [Buildroot] Wireless config tool
In-Reply-To: <CAN_xxrXSRK6-DPKkC+8UAVAWQQExVkgGPk4vvPWfMs_DsnJ2ng@mail.gmail.com>
References: <CAN_xxrXSRK6-DPKkC+8UAVAWQQExVkgGPk4vvPWfMs_DsnJ2ng@mail.gmail.com>
Message-ID: <20130204183343.GA4116@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephen,

On Mon, Feb 04, 2013 at 12:17:23PM -0500, Stephen Turner wrote:
> Firstly i would like to say thank you for the support on the Squashfs
> questions, i was able to get the information i needed to resolve that issue.
> 
> My current question is if im using a mobile device that will be connecting
> to various wifi hotspots i will need to be able to setup wifi connections
> easily from a gui. currently with buildroot i only see the option to
> manually edit configs to set up hotspots. Is there a tool im overlooking
> currently in buildroot to help with this setup or will i need to manually
> add one in? Im looking for something similiar to wicd or how a android
> device would manage wifi connections.

Seems you need connman (http://connman.net). Buildroot includes a fairly 
recent version of connman. I haven't tried it myself, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
