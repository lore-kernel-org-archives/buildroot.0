From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2016 15:49:35 +0200
Subject: [Buildroot] servers unavailable
In-Reply-To: <CA+TH9VkBy3_krEK-buHDxhMq_ooYLA=HODWovLjeFvpZ6M=zEg@mail.gmail.com>
References: <1468408735.29064.17.camel@synopsys.com>
 <87mvll6825.fsf@dell.be.48ers.dk>
 <CA+TH9VkBy3_krEK-buHDxhMq_ooYLA=HODWovLjeFvpZ6M=zEg@mail.gmail.com>
Message-ID: <20160713154935.625340f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jul 2016 15:26:45 +0200, Angelo Compagnucci wrote:

> Since buildroot has a github account, why keep the website outside?!
> Github offers github pages with custom domain and protected against
> ddos attacks (and many more attack vectors).
> And why use a custom git server? We can always switch off pull
> requests and issues and keep the patch flow going as it goes now if we
> switch to github.

I am also starting to think we should switch to use github. We could
also use the Github issue tracker, since http://bugs.busybox.net/ is
down as well.

How does one disable pull requests in a Github project? This is clearly
one aspect where I (and I believe most of the core developers) prefer
the mailing list based review than the Web-based review for pull
requests.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
