From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Aug 2014 21:29:45 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
	library/header paths
In-Reply-To: <20140822163057.GA3998@free.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53F656E5.9020802@openwide.fr> <20140821233312.03679844@free-electrons.com>
 <20140822163057.GA3998@free.fr>
Message-ID: <c4d57675-8499-4727-bdc1-4d8d772b6096@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Thomas, All,
>
>On 2014-08-21 23:33 +0200, Thomas Petazzoni spake thusly:
>> On Thu, 21 Aug 2014 22:30:29 +0200, Romain Naour wrote:
>> > Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
>> > BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?
>> 
>> No: BR2_* variables are Config.in options. Environment variables are
>> BR_*.
>
>Earlier this year in Brussels, we said we were to use BR2_ everywhere :
>    http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014

Hmm, that is written in the conclusion, but this is very
 different than what is in the 'proposed rules'.
Was it really the final outcome to use BR2 for all types
 of variable? I thought we wanted to make a
 distinction between config variables and others...

Best regards,
Thomas
