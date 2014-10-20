From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 16:30:51 +0200
Subject: [Buildroot] Firmware update for Buildroot
In-Reply-To: <CA+TH9VnM21MSTZ0HnWM_u+uSgLSzUj1=PhYfOFTfn6H7aMK_oQ@mail.gmail.com>
References: <CA+TH9VnM21MSTZ0HnWM_u+uSgLSzUj1=PhYfOFTfn6H7aMK_oQ@mail.gmail.com>
Message-ID: <20141020163051.1f4b05eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 20 Oct 2014 15:17:06 +0200, Angelo Compagnucci wrote:

> I'm looking for the best tool to prepare and apply firmware images
> based on Buildroot. I know that is a complex matter, but what I'm
> asking here is an advice.
> 
> After several hours of searching, I finally found what seems a good
> piece of software:
> 
> https://github.com/fhunleth/fwup
> 
> It's maintained and it has a  good integration with Buildroot.
> I know that Thomas Petazzoni wrote this one:
> 
> https://www.gitorious.org/embedded-linux-firmware-upgrade-tool
> 
> But It seems not maintained anymore.
> 
> Any advice on this matter?

There is also https://github.com/sbabic/swupdate, which was presented
last week at ELCE, see
http://events.linuxfoundation.org/sites/events/files/slides/SoftwareUpdateForEmbedded.pdf.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
