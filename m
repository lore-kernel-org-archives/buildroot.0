From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 22:13:38 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <87twa73hfx.fsf@dell.be.48ers.dk>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161213164933.6ffc2b51@free-electrons.com>
 <8737hr4xg6.fsf@dell.be.48ers.dk>
 <20161213172254.750ab43b@free-electrons.com>
 <CAB0FRsttHoYOhkbJHxKJTjjakT90zEBaJW34zLFaGiNd5pHipQ@mail.gmail.com>
 <87twa73hfx.fsf@dell.be.48ers.dk>
Message-ID: <20161213221338.36bfdd23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 17:46:42 +0100, Peter Korsgaard wrote:

>  > So many people/companies will stay with Qt 5.6  
> 
> Ok, so perhaps we should drop Qt 4.x and have separate packages for 5.6
> and 5.x (with .x >= 8)?

Separate packages mean that we have to change all packages that
currently use qt5, so that they can use either 5.6 or 5.8 (or later).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
