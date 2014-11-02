From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Nov 2014 22:54:11 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
Message-ID: <20141102225411.0fe3d3de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sun, 2 Nov 2014 22:14:10 +0100, Angelo Compagnucci wrote:

> Git send-email warned me, but sending you via patch
> seemed to me the best thing to do. Unfortunately, git send-email was right!

git send-email often is right :)

> Some tweaks are missing in vanilla bootstrap css, I tweaked a little
> to match the colour theme and font of the older website. You can find
> the right version here:
> 
> http://buildrootrd.idea-on-line.it/css/bootstrap.min.css

This doesn't seem very clean, and a bit opposite to the principle of
CSS, no? Why don't you create a separate CSS that overrides whatever
needs to be overridden?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
