From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 6 Sep 2007 18:50:22 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
In-Reply-To: <fbkjea$tfd$1@sea.gmane.org>
References: <fbkjea$tfd$1@sea.gmane.org>
Message-ID: <200709061850.22829.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha, All,

On Tuesday 04 September 2007 23:40, Micha Nelissen wrote:
> I am using buildroot SVN, gcc 4.2.1, uclibc 0.9.29, armeb-linux for
> xscale. I've configured to use software floating point. Linking of
> uclibc fails, it cannot find some functions which seem software floating
> point related e.g. __floatsidf.

Try attached patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 801-softfloat-fix.patch
Type: text/x-diff
Size: 2762 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070906/cd724734/attachment-0001.bin 
