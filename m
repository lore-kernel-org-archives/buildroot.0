From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 11:28:00 +0200
Subject: [Buildroot] Buildroot 2015.02-git-00861-gae5ed8b make error
In-Reply-To: <CABzetm3xjJzctWgto-SF83tABonMWTU=O72tRr4TDO1+_EYN0w@mail.gmail.com>
References: <CABzetm3xjJzctWgto-SF83tABonMWTU=O72tRr4TDO1+_EYN0w@mail.gmail.com>
Message-ID: <20150407112800.50d89fc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Tue, 7 Apr 2015 10:50:53 +0200, Rohit Kumar wrote:

> You seem to have the current working directory in your
> LD_LIBRARY_PATH environment variable. This doesn't work.
> make: *** [core-dependencies] Error 1
> 
> my LD_LIBRARY PATH is
> "/opt/ros/fuerte/lib:/opt/ros/fuerte/lib:"
> 
> what is worng here??

The final ':' without anything afterwards. Remove it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
