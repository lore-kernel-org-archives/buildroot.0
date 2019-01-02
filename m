From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Jan 2019 08:49:06 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lua*: drop redundant
 dependencies on BR2_PACKAGE_HAS_LUAINTERPRETER
In-Reply-To: <20181231165003.18574-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 31 Dec 2018 17:50:01 +0100")
References: <20181231165003.18574-1-thomas.petazzoni@bootlin.com>
 <20181231165003.18574-2-thomas.petazzoni@bootlin.com>
Message-ID: <87o98zpki5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > All the packages modified by this commit have their Config.in included
 > by package/Config.in inside a BR2_PACKAGE_HAS_LUAINTERPRETER &&
 > !BR2_STATIC_LIBS condition. Therefore, duplicating the
 > BR2_PACKAGE_HAS_LUAINTERPRETER condition in each of their Config.in
 > file is redundant and unnecessary. This commit drops such redundant
 > "depends on" statements.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
