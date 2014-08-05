From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Aug 2014 10:04:32 +0200
Subject: [Buildroot] buildroot buid error for ARM cortex-A9
In-Reply-To: <CABzetm3TpngJTewH+xGygT2gHhB_7wSwargFkJ=VY+VgD2VHzA@mail.gmail.com>
References: <CABzetm3TpngJTewH+xGygT2gHhB_7wSwargFkJ=VY+VgD2VHzA@mail.gmail.com>
Message-ID: <20140805100432.193814a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Tue, 5 Aug 2014 16:54:42 +0900, Rohit Kumar wrote:

> >>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Downloading
> /home/rohit/Desktop/buildroot_odroid/support/download/git: line 30: [:
> -eq: unary operator expected

Which version of Buildroot are you using exactly? Could you post your
Buildroot .config?

(Basically, whenever you report a Buildroot issue, *always* include the
specific Buildroot version you're using, as well as the
Buildroot .config. Any bug report without those informations is almost
useless.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
