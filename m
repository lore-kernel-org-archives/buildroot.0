From: Remi Pommarel <repk@triplefau.lt>
Date: Wed, 28 Oct 2015 09:23:27 +0100
Subject: [Buildroot] [PATCH 3/3] package/git: Used curl-config program
 for target
In-Reply-To: <563003C1.3000104@mind.be>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
 <1445893962-13338-4-git-send-email-repk@triplefau.lt>
 <563003C1.3000104@mind.be>
Message-ID: <20151028082327.GC13534@cruxbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 28, 2015 at 12:07:45AM +0100, Arnout Vandecappelle wrote:
> On 26-10-15 22:12, Remi Pommarel wrote:
> > Fix cross compilation by using curl-config script for target instead of the
> > one from host.
> > 
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> 
>  Again, please patch configure.ac instead of configure. Otherwise, looks good to
> me. Though I didn't immediately understand why it wasn't necessary to add
> CURL_CONFIG to config.mak.in

Ok I will use configure.ac patch instead. Git can be configured using
two ways, either using configure or using config.mak.in. I could have set
CURL_CONFIG in config.mak.in also but using the two methods at the same
time is redundant.

Thanks

-- 
R?mi
