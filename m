From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 02 May 2013 12:21:10 -0300
Subject: [Buildroot] [PATCH] iw: bump to version 3.10
In-Reply-To: <20130502172008.73087748@skate>
References: <1367504638-21071-1-git-send-email-gustavo@zacarias.com.ar>
 <20130502172008.73087748@skate>
Message-ID: <51828466.4030105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2013 12:20 PM, Thomas Petazzoni wrote:
>> +IW_MAKE_OPT = CC=$(TARGET_CC) LD=$(TARGET_LD) LDFLAGS=$(TARGET_LDFLAGS)
> 
> Missing quotes, will break when ccache is enabled. You should probably
> be using $(TARGET_CONFIGURE_OPTS) instead.

Aich!
TARGET_CONFIGURE_OPTS doesn't work, it breaks in this case.
Regards.
