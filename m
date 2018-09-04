From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Sep 2018 10:27:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/make: add host variant
In-Reply-To: <CANQCQpbQwbKOpVA3rUE1jR18Breh8uZR1uRdizCo0F9RR1_C5g@mail.gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <CANQCQpbQwbKOpVA3rUE1jR18Breh8uZR1uRdizCo0F9RR1_C5g@mail.gmail.com>
Message-ID: <20180904102757.7ab08189@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Sep 2018 14:55:11 -0500, Matthew Weber wrote:

> I plan to give this a test tomorrow.  We have been close to sending
> something similar because of a Make 3 vs 4 issue across vintages of
> builds we've been supporting.  I wonder if there is any interest
> picking this one back into the LTS?

If you're talking about the issue that Sam Voss was discussing on IRC,
then it's different. Your issue was that your host machine is using
make >= 4.0, but some of your funky packages don't like that and would
need make < 4.0 to build.

This is not handled by Romain's series@all, which handles the
opposite situation: packages that need make >= 4.0, but the host has
make < 4.0.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
