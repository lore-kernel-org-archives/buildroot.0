From: Tom <fivemiletom@gmail.com>
Date: Tue, 26 Jun 2007 14:19:19 -0700
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070626133327.GA5989@trinity.fluff.org>
References: <20070626133327.GA5989@trinity.fluff.org>
Message-ID: <468182D7.30509@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben Dooks wrote:
> Has anyone had success with building an EABI buildroot? I have tried
> building ARM (arm920t,gcc 4.1.2) and the image produced hangs (it
> seems vfprintf does not work)
> 
> I have succesfully built images with gcc 4.1.2 and a patch to make it
> build gcc with OABI.
> 

Yes, I had success. (After an issue described in "[Buildroot] Arm / 
buildroot / kernel issue: init crashes?", maybe this is your problem too.)
