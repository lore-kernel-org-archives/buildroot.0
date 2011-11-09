From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 9 Nov 2011 09:39:34 +0100
Subject: [Buildroot] Cygwin build - MPC
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6702C398EE@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB6702C398EE@WETMEX10.loepfe.com>
Message-ID: <201111090939.35013.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noel, Thomas,

On Wednesday 09 November 2011 092638 Vellemans, Noel wrote:
> While testing the current git-tree under Linux and cygwin, I have run
> into the following build-problem.
> 
> Host-mpc fails to build on a windows host (on Cygwin).
[--SNIP--]
> And of course once found... I very quickly ended up with 'googeling' for
> the same problem and yes... there was indeed someone that also has
> discovered this...
> 
> http://lists.gforge.inria.fr/pipermail/mpc-discuss/attachments/20110430/
> 9b6dfa4b/attachment.obj
> 
> http://lists.gforge.inria.fr/pipermail/mpc-discuss/2011-April/000898.htm
> l

Ah, I see why I don't get this in crosstool-NG. That's because the companion
libraries (GMP, MPFR, MPC and the likes) are build statically. So, we do
not have that issue in crosstool-NG.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
