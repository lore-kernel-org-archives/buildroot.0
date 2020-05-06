From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:27:17 +0200
Subject: [Buildroot] [PATCH 1/4] package/polkit: install service file
In-Reply-To: <20200418025816.1642936-1-aduskett@gmail.com> (aduskett's message
 of "Fri, 17 Apr 2020 19:58:13 -0700")
References: <20200418025816.1642936-1-aduskett@gmail.com>
Message-ID: <87sggdeiq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > The default installed service file is missing a target, which causes preset-all
 > to not enable the service.

 > Add the service file to package/polkit with the addition of:

 > [Install]
 > WantedBy=multi-user.target

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
