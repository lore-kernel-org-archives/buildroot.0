From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 10:19:46 +0100
Subject: [Buildroot] [PATCH v4 1/5] sdl: add host version
In-Reply-To: <CAGduivwvb92qcbTwvQK13iiT2pd_ZF8_cTUM9ooAtAP9SeLe0A@mail.gmail.com>
References: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390772341-6790-2-git-send-email-maxime.hadjinlian@gmail.com>
 <20140128230748.65a61e66@skate>
 <CAGduivwvb92qcbTwvQK13iiT2pd_ZF8_cTUM9ooAtAP9SeLe0A@mail.gmail.com>
Message-ID: <20140129101946.52ce51b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Wed, 29 Jan 2014 10:16:52 +0100, Maxime Hadjinlian wrote:

> This is needed by TexturePacker which is a host tool, that is used to
> pack the various images (jpeg and png) found in XBMC's GUI (Since it
> supports themes), it will generate a XBT file, wich will be read by
> XBMC on the target to depack and display the GUI.

Ok, thanks! It answers my curiosity question :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
