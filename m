From: Alex Bradbury <asb@asbradbury.org>
Date: Wed, 8 Aug 2012 22:55:15 +0100
Subject: [Buildroot] building native gcc for target
In-Reply-To: <CAKWKLJBK4Kt5keBO8OwPn4-YjwBAt1y2y=fx9qD6kYMYaCYZsA@mail.gmail.com>
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
 <CAKWKLJBK4Kt5keBO8OwPn4-YjwBAt1y2y=fx9qD6kYMYaCYZsA@mail.gmail.com>
Message-ID: <CA+wH297SoYsDPm3zo1xxL-AraGFgnKKvt7bTxqEWQ4DCuqHkJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 August 2012 21:49, Kevin Broch <kevbroch@gmail.com> wrote:
> As for why(some just examples):
> - use buildroot to create a native development platform for
> http://www.raspberrypi.org/
> - isolated system that has feedback loop from sensor data which requires
> periodic recompilation of C source
> - stress test hardware using gcc as a workload

Plus it would be a little cool to use buildroot to compile a rootfs
with enough host dependencies to run buildroot on the target.

Alex
