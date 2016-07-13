From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 13 Jul 2016 10:14:08 -0400
Subject: [Buildroot] servers unavailable
In-Reply-To: <20160713154935.625340f7@free-electrons.com>
References: <1468408735.29064.17.camel@synopsys.com>
 <87mvll6825.fsf@dell.be.48ers.dk>
 <CA+TH9VkBy3_krEK-buHDxhMq_ooYLA=HODWovLjeFvpZ6M=zEg@mail.gmail.com>
 <20160713154935.625340f7@free-electrons.com>
Message-ID: <CALe+oY_pA3j1iooQSSWmC+fOkPd-Q-3ZqsVoPGzKkoQ5cBBu0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jul 13, 2016 at 9:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> How does one disable pull requests in a Github project?

You can't. :(

Aside from ignoring or manually closing requests, you can setup
scripts [1] to auto-close pull requests (although, I've never tried
them).

[1]: https://github.com/imjasonh/nopullrequests
