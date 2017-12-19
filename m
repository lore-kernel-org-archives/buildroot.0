From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 09:39:47 +0100
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.10.0 and
 add license hash
In-Reply-To: <87ind37kdt.fsf@dell.be.48ers.dk>
References: <20171210233349.24682-1-mlang@blind.guru>
 <20171212070736.04953cff@windsurf.png.is.keysight.com>
 <20171212123040.35400bc4@windsurf> <877etnj677.fsf@home.blind.guru>
 <20171216133439.58247290@windsurf> <20171217173911.GA7491@scaer>
 <87ind37kdt.fsf@dell.be.48ers.dk>
Message-ID: <20171219093947.7256a9c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 23:15:42 +0100, Peter Korsgaard wrote:

>  > I looke at my autobuilder, and it uses gcc-4.8.2, and cmake builds fine
>  > with that...  
> 
>  > gcc-4.8 was released in March 2013, which will be almost 5 years ago
>  > when we tag LTS 2018.02. So maybe we can keep using cmake-3.9 up until
>  > 2018.02, then update our requirements to require a host gcc >= 4.8m
>  > which will allow us to bump cmake to 3.10.  
> 
>  > I agree that, with time passing, more and more packages will require
>  > C++11, so it will make sense to require proper C++11 support for the
>  > host compiler.  
> 
> Yes, maybe that is indeed the best way forward - Post 2018.02 that is.

It feels a bit annoying to make such a change that would impact all
Buildroot users, just for the sole reason of an optimization down into
CMake.

I agree that we won't be able to avoid using a C++11 compiler on the
host at some point. I'm just trying to see if we can avoid this when
reasonably possible.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
