From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 May 2016 14:53:41 +0200
Subject: [Buildroot] [RFC/PATCH next 2/2] couchdb: New package.
In-Reply-To: <b4651105-f652-0bd1-b5ef-4cf0be436522@mind.be>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1463673580-10676-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <b4651105-f652-0bd1-b5ef-4cf0be436522@mind.be>
Message-ID: <20160520145341.156fab90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 May 2016 00:41:28 +0200, Arnout Vandecappelle wrote:
> On 05/19/16 17:59, Nicolas Cavallari wrote:
> > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>  
> 
>  My first reaction was: can't we use a more recent version from git instead of
> an almost-two-years-old release, but that won't be easy because of all the
> submodules.

Does the latest git versions also need spidermonkey 1.8.5 ?

If not, then I think I'd prefer to add support to fetch submodules (we
already have patches doing this, from Yann, and they are reasonable),
and skip the addition of this unmaintained spidermonkey thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
