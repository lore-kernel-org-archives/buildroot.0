From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 22:49:03 +0200
Subject: [Buildroot] [PATCH 1/7] support/docker/Dockerfile: new package
 expect
In-Reply-To: <1556555546-9246-2-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-2-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1022b8f4-2e6e-92b2-5cbe-056844c77b07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 18:32, Jugurtha BELKALEM wrote:
> Special note concerning python-pexpect package which can be
> used for the same task: After testing the package, We
> have noticed that it does not show the automation process
> correcly (you may not even see the message welcome to buildroot)
> and it is not verbose when errors are encountered.

 Could you expand on this a little? We've been using pexpect (both fdpexpect and
pxssh) very successfully for our testing project. Admittedly, we only use
Python3 so maybe that's where the problem is.

 Clearly, for this simple use case it should be acceptable to use tk-expect
(even though I expect hardly anyone under the age of 40 to still know about it
:-). But if we're going to reuse the same approach for other tests as well, we
might benefit from a more powerful and python-integrated package.

 Regards,
 Arnout
