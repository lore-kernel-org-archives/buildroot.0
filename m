From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Jul 2013 19:25:24 -0300
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <20130717215826.60942218@skate>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate>
Message-ID: <51E719D4.4070304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2013 04:58 PM, Thomas Petazzoni wrote:

> Ok, so if I select "Thumb" for ARMv5T, but use a normal ARMv5
> external toolchain (compiled ARM, not Thumb), it should work. Am I
> correct?

Yes, because at the moment it's a NOP, we don't do anything regarding
thumb and external toolchains :)
However if we did it must work, it's part of the spec and the gcc
default as long as we are talking about a thumb-supporting cpu of course.
Regards.
