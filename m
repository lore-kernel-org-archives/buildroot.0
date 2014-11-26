From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 26 Nov 2014 11:20:47 -0600
Subject: [Buildroot] [PATCH next] package: add python-networkmanager
In-Reply-To: <1416989784-4371-1-git-send-email-peter@korsgaard.com>
References: <1416989784-4371-1-git-send-email-peter@korsgaard.com>
Message-ID: <CAMQcK5J7RYR0mfDOQFhsY8Pxv-36xHOCiCwYua-QA4SRRNOi4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Nov 26, 2014 at 2:16 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                                        |  1 +
>  package/python-networkmanager/Config.in                  | 15 +++++++++++++++
>  package/python-networkmanager/python-networkmanager.hash |  3 +++
>  package/python-networkmanager/python-networkmanager.mk   | 14 ++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/python-networkmanager/Config.in
>  create mode 100644 package/python-networkmanager/python-networkmanager.hash
>  create mode 100644 package/python-networkmanager/python-networkmanager.mk

I have built this with a PowerPC e500mc toolchain and everything
appears to build fine.

Acked-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
