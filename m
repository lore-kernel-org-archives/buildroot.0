From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 08:21:57 +0200
Subject: [Buildroot] A new version of http://autobuild.buildroot.org
In-Reply-To: <51916E73.4000403@mind.be>
References: <20130513232154.477c6c7b@skate>
	<51916E73.4000403@mind.be>
Message-ID: <20130514082157.2f9f16aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 May 2013 00:51:31 +0200, Arnout Vandecappelle wrote:
> On 13/05/13 23:21, Thomas Petazzoni wrote:
> >   * The full build log is no longer available. Storing those entire
> >     build logs was consuming a huge amount of disk space. I assume that
> >     the last 100 lines of the build log are sufficient to have a rough
> >     idea of what's going. Otherwise, the build can easily be reproduced.
> 
>   Still, there have been (very few) situations where the error message 
> itself was not in the last 100 lines. I think 500 lines is safer.

Ok, I'll change that.

Thanks for the suggestion,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
