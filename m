From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 09:44:05 +0200
Subject: [Buildroot] Autobuild.b.o status
In-Reply-To: <87vaj9c9cd.fsf@dell.be.48ers.dk>
References: <20171021080444.648fcfa1@windsurf>
 <87vaj9c9cd.fsf@dell.be.48ers.dk>
Message-ID: <20171021094405.300e1357@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 08:18:26 +0200, Peter Korsgaard wrote:

>  > Due to the size of the data involved in the autobuilders (gigabytes of
>  > logs), I never bothered doing backups, so effectively the history of
>  > build results is lost. Retrospectively, now that I realize that it
>  > means all build result URLs that we embed in the commit logs are
>  > broken, I think making a back up of those results does make sense.  
> 
> Out of interest, how many gigabytes are we talking about approx?

Now that the data is lost, I obviously don't have numbers anymore, but
it was in the order of a few tens of gigabytes.

Right now, we have 175 results and it's 56 MB of log/configs (i.e not
counting the MySQL database size). I think we had 200.000 build
results, so that would mean ~64 GB of data.

An ASCII dump of the SQL database right now (with 175 results) is 64 MB.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
