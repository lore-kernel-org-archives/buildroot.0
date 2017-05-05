From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 21:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] fix help text wrapping for configs
 starting with 'a'
In-Reply-To: <20170505103343.27171-1-aduskett@codeblue.com>
References: <20170505103343.27171-1-aduskett@codeblue.com>
Message-ID: <20170505212346.2aa0b7c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 May 2017 06:33:43 -0400, Adam Duskett wrote:

> -	  Program to change the display mode of Allwinner ARM SOCs running
> -	  the linux-sunxi kernel (and not the mainline kernel.)
> +	  Program to change the display mode of Allwinner
> +	  ARM SOCs running the linux-sunxi kernel

This rewrapping is wrong, the first line should end with "ARM SOCs", so
only the word "running" should be on the next line.

Please verify globally, ideally by using a tool that rewraps
automatically to the correct length.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
