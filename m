From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 19 Nov 2015 18:17:09 -0600
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <CAMQcK5+VXwL7rKFk3KA_OTN6AULYbY3tumaGE_yGtwCuoqoELg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Clayton

On Thu, Nov 19, 2015 at 5:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/150fa803fc3b65f75dce2847907ee768fc94c7a7/
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/fc97e1ac52d40ced6a5f9cd980d7f448c98e5c78/
>> arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/64dac2a7e5a757ed23060c550b7d56f54659a368/
>
> ustr doesn't play well with gcc 5 it seems. Clayton, can you have a look ?

Looks like this is a known issue and debian has fixed it. Fix should
probably be to pull in the debian packages.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777460

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
