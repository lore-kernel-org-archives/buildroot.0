From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 12:27:27 +0100
Subject: [Buildroot] Patch: qt5webkitexamples
In-Reply-To: <87lht5lrd8.fsf@dell.be.48ers.dk>
References: <1402067773.64897.YahooMailNeo@web172303.mail.ir2.yahoo.com>
 <20140607122338.33ab44ce@free-electrons.com>
 <1402138061.2503.YahooMailNeo@web172304.mail.ir2.yahoo.com>
 <20140607184839.33bfa8e0@free-electrons.com>
 <87lht5lrd8.fsf@dell.be.48ers.dk>
Message-ID: <20150305122727.27675823@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

Yes, reviving a very old thread.

On Mon, 09 Jun 2014 23:12:19 +0200, Peter Korsgaard wrote:

>  > It's just that I haven't automated the task of updating our Github
>  > clone, so I only do it from time to time.
> 
> It would be good if you could add a cronjob to do it daily or so (or I
> can do it if you prefer). Is there an easy way to inform users that this
> is just a mirror and we would like contributors to use the mailing list
> instead of the github features?

This is now done:

 *) I've added a cronjob that updates the Github mirror automatically.
    A special Github user buildroot-auto-update has been created, which
    uses a special SSH key with no passphrase, used by my cronjob to do
    the update of the Github repository. It is updated every 10 minutes.

 *) I've added a mention at https://github.com/buildroot/buildroot that
    this is not the official Git repository.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
