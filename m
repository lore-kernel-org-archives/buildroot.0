From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 21:47:29 +0200
Subject: [Buildroot] Issue with the autobuilders: removing 1379 builds
 from the history?
In-Reply-To: <51A50964.7090503@mind.be>
References: <20130528091052.16da9159@skate>
	<51A50964.7090503@mind.be>
Message-ID: <20130528214729.6a3669e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 28 May 2013 21:45:40 +0200, Arnout Vandecappelle wrote:

>   I would wait a couple of days before removing them. At least for the 
> most recent ones, current HEAD probably still exposes the same problem, 
> so in that sense the build result is still usable.

Ok. I'm not sure they are really usable, but ok.

>   Would it be possible to direct the URLs to a placeholder page 
> explaining that the build result was removed, so existing links in commit 
> messages don't die?

Yes, I can keep the output directories around, wipe-out their contents,
and replace it with just a README.txt file that says it has been
removed and why. Would this be ok for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
