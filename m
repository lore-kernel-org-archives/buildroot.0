From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Wed, 16 Jul 2014 14:25:08 +0200
Subject: [Buildroot] [RFC 0/9] Add libgtk3 and bump webkit to version
 2.4.3
In-Reply-To: <20140715232113.148f8c94@free-electrons.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
 <20140715232113.148f8c94@free-electrons.com>
Message-ID: <53C66F24.4070409@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 15 Jul 2014 23:21:13 +0200, Thomas Petazzoni wrote:
> Dear Hadrien Boutteville,
> 
> On Tue,  8 Jul 2014 15:57:03 +0200, Hadrien Boutteville wrote:
> 
>> This series mainly does two things: add libgtk3 and bump webkit.
>>
>>  - 1..5: requirements and dependencies for libgtk3
>>  - 6: add libgtk3
>>  - 7: bump webkit
>>  - 8: is required by Midori
>>  - 9: bump Midori to test WebKit 2.4.3
> 
> I've applied patches 1, 2 and 3 of your series. For the rest of the
> series, I'm waiting for some more review. But at least having the
> libglib and pango bumps applied will give them some testing in the
> autobuilders. Get ready to fix issues if some appears.

Sure, thanks!

Hadrien
