From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 22:53:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/polkit: add linux-pam as a
 dependency if linux-pam is selected
In-Reply-To: <20200315205610.2227486-1-aduskett@gmail.com> (aduskett's message
 of "Sun, 15 Mar 2020 13:56:10 -0700")
References: <20200315205610.2227486-1-aduskett@gmail.com>
Message-ID: <878sjt4boi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Without linux-pam built first, polkit will throw a configuration error:
 > configure: error: Could not find pam/pam-devel, please install the needed packages.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
