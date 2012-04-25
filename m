From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 11:21:18 -0300
Subject: [Buildroot] util-linux builds and installs lots of unwanted
 binaries
In-Reply-To: <1334682533.8917.2.camel@bender>
References: <1334589472.13607.15.camel@sven>
 <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
 <1334651710.2527.5.camel@sven>
 <e75db664abe7bb6fc8133d5f41c18f63@zacarias.com.ar>
 <1334682533.8917.2.camel@bender>
Message-ID: <b4364cb71e6c9c0f1cd860c9940e2c4c@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-17 14:08, Sven Neumann wrote:

> Adding an option for each and every utility would probably be too 
> much.
> But we could introduce options for each of the sub-directories in
> util-linux (disk-utils, misc-utils, etc). Then one could use 'make -D
> (subdir) install' to install all the utilities from a sub-directory.
>
>
> Regards,
> Sven

Just sent a new version of the patch.
I'll just steer away from going all detailed on the options and kept it 
simple with an "install utilities" option.
If someone needs util-linux i take it they're ready to pay the price 
either in time (removing unused) or space for it.
Regards.
