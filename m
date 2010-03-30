From: William Wagner <will_wagner@carallon.com>
Date: Tue, 30 Mar 2010 14:18:07 +0100
Subject: [Buildroot] QT embedded working with Xorg?
In-Reply-To: <4BB1F87D.4050706@terawatt.fr>
References: <4BB1EE15.6000505@browserseal.com> <4BB1F87D.4050706@terawatt.fr>
Message-ID: <4BB1FA0F.5070703@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/2010 14:11, Damien Borie wrote:
> Hello,
>
> I have a simple question : is Qt Embedded compatible with Xorg?
> I have an application made for Qt Embedded with Framebuffer, and I had 
> to change my distribution to use the server X Xorg, but now the 
> application isn't working.
> Of what I see when searching, I'm afraid I must use QT and not QT 
> Embedded, and as it's not included in Buildroot, I'm a bit reticent...
> Is there any option I don't know which allows to use X server?

You need to use Qt compile for X11 for it to work with XOrg. I have 
modified Qt in my tree to make it an option to build for X. Give me a 
couple of days and I'll calean it up and send it to the list.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
