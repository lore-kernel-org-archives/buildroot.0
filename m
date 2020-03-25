From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 25 Mar 2020 15:32:47 +0100
Subject: [Buildroot] libnss build failure on ARM
In-Reply-To: <20200325073125.10426911@windsurf.home>
References: <20200325073125.10426911@windsurf.home>
Message-ID: <b98858c0-d3a4-b5e2-a942-a0bea21ab188@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/25/20 7:31 AM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> We have a build failure affecting libnss on ARM in one of our defconfig:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/483712746
> 
> Could you have a look ?

I've just sent a patch for this:
https://patchwork.ozlabs.org/patch/1261416/

-- 
Giulio Benetti
Benetti Engineering sas
