From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 22:30:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix swig build error
 when using cmake 3.12
In-Reply-To: <20181226221840.0181c8ec@windsurf>
References: <20181223195714.17155-1-mark.corbin@embecosm.com>
 <20181223212923.GB24194@scaer> <20181226221840.0181c8ec@windsurf>
Message-ID: <20181226213048.GJ14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-26 22:18 +0100, Thomas Petazzoni spake thusly:
> On Sun, 23 Dec 2018 22:29:23 +0100, Yann E. MORIN wrote:
> > We've another user on IRC, reporting issues with cmake-3.13. Should we
> > now black=list cmake 3.12 and above, and always build our own?
> 
> I really don't like blacklisting recent versions of tools. So if we
> were to blacklist CMake 3.13 and newer, I'd like to see a proper
> explanation of what the problem is and why blacklisting CMake 3.13 and
> newer is the only reasonable solution.

100% agreed.

Let's put this at rest until we have proper explanation and reproducer.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
