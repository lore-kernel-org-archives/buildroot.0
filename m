From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 23:19:39 +0100
Subject: [Buildroot] [PATCH 1/8] Adding janus-gateway and dependencies
In-Reply-To: <20141210213815.6f06e336@free-electrons.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
 <54887D2A.3030706@imgtec.com>
 <CAEbDrgk4gmjkchtdMTor_RQp_KEqdUBJRHjUAf_6qj_g-wuQkw@mail.gmail.com>
 <54888208.1000901@imgtec.com>
 <20141210213815.6f06e336@free-electrons.com>
Message-ID: <20141210221939.GJ3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-10 21:38 +0100, Thomas Petazzoni spake thusly:
> Dear Vicente Olivert Riera,
> 
> On Wed, 10 Dec 2014 17:25:28 +0000, Vicente Olivert Riera wrote:
> 
> > On 12/10/2014 05:23 PM, Gregory Dymarek wrote:
> > > Do you need hashes for GIT/SVN checkouts?
> > 
> > Well, you are downloading a tarball which should be always the same, no?
> 
> No, for git and svn you are not downloading a tarball. We are cloning
> the Git repository or checkouting the SVN repository, and then making a
> tarball out of it.

But inthis case, we're not doing a git-clone, we;re using a snapshot.
Which should by the way be using the github helper, rather than the
manaul _SITE method.

> I don't think we have any guarantee that the tarball
> created on the different machines will be the same, due to the file
> timestamps.

No we do not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
