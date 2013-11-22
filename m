From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Nov 2013 18:49:43 -0300
Subject: [Buildroot] [PATCH 3/3] jq: switch to official tarball
In-Reply-To: <87siuom4cm.fsf@dell.be.48ers.dk>
References: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>	<1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
 <87siuom4cm.fsf@dell.be.48ers.dk>
Message-ID: <528FD177.9070802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2013 07:58 PM, Peter Korsgaard wrote:
> We have a problem here :/
> 
> The git tree tarball we used to download was also called jq-1.3.tar.gz,
> so people who already downloaded it (and sources.buildroot.net) will NOT
> redownload it, so the build will fail as there's no configure.

As Danomi said it's a non-issue.
I've got a patchset in the works for this kind of issues (together with
the long overdue tarball hashes), however for personal reasons my free
time is like 0 for at least a few days more.
Regards.
