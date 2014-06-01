From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 01 Jun 2014 09:46:50 -0300
Subject: [Buildroot] [PATCHv2 2/2] glibc: add eglibc 2.19-svnr25243 and
 choice menu
In-Reply-To: <20140601143431.683da18d@free-electrons.com>
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>	<1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
 <20140601143431.683da18d@free-electrons.com>
Message-ID: <538B20BA.5040600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/2014 09:34 AM, Thomas Petazzoni wrote:

> I'd like to see a comment above this dependency that explains why we
> have this dependency: it's not because there is no support for PowerPC
> SPE, but only because it's broken, so a future bump to a newer version
> of eglibc 2.19 might fix the problem.

Ok.
For the record there are other commits in a similar vein that didn't get
that benefit, and it's build breakage (so quite obvious to test & catch).
Regards.
