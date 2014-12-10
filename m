From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:38:15 +0100
Subject: [Buildroot] [PATCH 1/8] Adding janus-gateway and dependencies
In-Reply-To: <54888208.1000901@imgtec.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
 <54887D2A.3030706@imgtec.com>
 <CAEbDrgk4gmjkchtdMTor_RQp_KEqdUBJRHjUAf_6qj_g-wuQkw@mail.gmail.com>
 <54888208.1000901@imgtec.com>
Message-ID: <20141210213815.6f06e336@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Dec 2014 17:25:28 +0000, Vicente Olivert Riera wrote:

> On 12/10/2014 05:23 PM, Gregory Dymarek wrote:
> > Do you need hashes for GIT/SVN checkouts?
> 
> Well, you are downloading a tarball which should be always the same, no?

No, for git and svn you are not downloading a tarball. We are cloning
the Git repository or checkouting the SVN repository, and then making a
tarball out of it. I don't think we have any guarantee that the tarball
created on the different machines will be the same, due to the file
timestamps.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
