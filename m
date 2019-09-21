From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:52:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/kf5: fix _LICENSE_FILE ->
 _LICENSE_FILES typos
In-Reply-To: <20190920114336.13661-1-nicolas.carrier@orolia.com>
References: <20190920114336.13661-1-nicolas.carrier@orolia.com>
Message-ID: <1cea1c14-7cc0-b18d-8e8c-172479cbf1b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/09/2019 13:45, Nicolas Carrier wrote:
> This fixes WARNINGs in make legal-info of the kind:
>     WARNING: kf5-extra-cmake-modules-5.47.0: cannot save license
>     (KF5_EXTRA_CMAKE_MODULES_LICENSE_FILES not defined)
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

 Applied to master, thanks.

 So people *are* using those kf5 packages. I was wondering about that :-)

 Regards,
 Arnout
