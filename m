From: Christian Stewart <christian@paral.in>
Date: Tue, 9 May 2017 22:56:14 -0400
Subject: [Buildroot] [PATCH 3/3] docker-engine: add support for init
	processes
In-Reply-To: <20170510025108.21169-3-christian@paral.in>
References: <20170510025108.21169-1-christian@paral.in>
 <20170510025108.21169-3-christian@paral.in>
Message-ID: <CA+h8R2pNfVmJPWtgJLkSazP0UgHgra8A6vAUqDuAbLsd7iqJUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All:

Despite proofreading this, I have overlooked two typos in this commit message:

On Tue, May 9, 2017 at 10:51 PM, Christian Stewart <christian@paral.in> wrote:
> This is necessary in may cases

Should read: "this is necessary in many cases"

> The docker-init binary is backed by tini on default, but optionally can
> be changed to docker-init by user preference.

Should read: "The docker-init binary is backed by tini on default, but
optionally can be
backed by dumb-init according to user preference."

Apologies for any confusion.

~ Christian
