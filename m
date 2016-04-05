From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 4 Apr 2016 17:53:37 -0700
Subject: [Buildroot] need help with adding python-mysqldb
In-Reply-To: <CAJJ6jxvP3v5968+NB4Q6ETdGO_4ubmNt6i-Egp9RL5NBMsh_mA@mail.gmail.com>
References: <CAPTQzABFmehM_FhTOvMWO9Jmc63u8BLX1sG1B_zDU=OED57nVA@mail.gmail.com>
 <CAJJ6jxvP3v5968+NB4Q6ETdGO_4ubmNt6i-Egp9RL5NBMsh_mA@mail.gmail.com>
Message-ID: <CAJJ6jxus=6XXe+Av1b=Mt+SbfSdC3j4xFH1jTufCu3VULJkRRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
> I looked at adding mysqldb - its make system is truly convoluted.
> Since I did not need the absolute maximum speed (some parts are in C),
> I jumped to MySqlDB. I have not seen any speed comparisons between the
> two, but I prefer one that works and is maintained to the alternative.
> MySqlDB works exactly the same way (no changes to the calling python)
> and easily fits into the buildroot make structure.
>
> I am in process of getting the package into buildroot. Check the
> recent mail list archives. You can download the patch and try it.
>
> Regards, Steve

I completely screwed up my response. The package I am adding and using
is PyMySQL -- the one I gave up on is mysqldb.

Sorry for the confusion,

Steve
