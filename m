From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 8 Feb 2012 10:12:15 +0100
Subject: [Buildroot] [PATCH] New package: gpio9260
In-Reply-To: <CAC78Gpc3fHmCkD2idUGDJzoHqw0h1JfKKq70TOZoi=sw7gx4og@mail.gmail.com>
References: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
 <87ehu7vfhx.fsf@macbook.be.48ers.dk>
 <CAC78Gpc3fHmCkD2idUGDJzoHqw0h1JfKKq70TOZoi=sw7gx4og@mail.gmail.com>
Message-ID: <20120208091215.GC19413@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16:43 Mon 06 Feb     , J.C. Woltz wrote:
>        J> From: "J.C. Woltz" <jwoltz@gmail.com>
>       J> gpio9260 is an utility used to read and set gpio states on
>       J> the at91sam9260 and at91sam9g20 CPUs
> 
>      What's the advantage of using this compared to normal /sys/class/gpio
>      sysfs access?
> 
>    I did not write this program. Its header states:
>    /*
>     * (C) Copyright 2004  Roman Avramenko <roman@imsystems.ru>
>     *
>     * This program is free software; you can redistribute it and/or
>     * modify it under the terms of the GNU General Public License as
>     * published by the Free Software Foundation; either version 2 of
>     * the License, or (at your option) any later version.
>     *
>     * This program is distributed in the hope that it will be useful,
>     * but WITHOUT ANY WARRANTY; without even the implied warranty of
>     * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     * GNU General Public License for more details.
>     *
>     * You should have received a copy of the GNU General Public License
>     * along with this program; if not, write to the Free Software
>     * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
>     * MA 02111-1307 USA
>     */
> 
>    Calao and Synapse Wireless ship the gpio9260 to allow script and users
>    easy access to (primarily) push buttons. It is used like:
>    /usr/bin/gpio9260 ?PB10
>    Then the return code lets you know the state of the input. Or it can be
>    used to set outputs, but in that case the /sys/class/led or other makes
>    sense.
>     
> 
>      It's just a program (no headers/libraries), so why install into staging?
> 
>    That is my mistake. I will fix that.
For Calao platfrom this is depricated

Best Regards,
J.
