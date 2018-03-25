From: daggs <daggs@gmx.com>
Date: Sun, 25 Mar 2018 12:42:53 +0200
Subject: [Buildroot] Make C and CXX compiler cache in
 toolchainfile.cmake.in
In-Reply-To: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
References: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
Message-ID: <trinity-81772261-5a5f-4894-87f4-edd212a9650a-1521974573144@3c-app-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Michael,
?

>Sent:?Sunday, March 25, 2018 at 1:36 PM
>From:?"Michael Dick" <mi-dick@gmx.de>
>To:?buildroot at busybox.net
>Subject:?[Buildroot] Make C and CXX compiler cache in toolchainfile.cmake.in
>
>Hello,
>I am using buildroot to create my custom gcc toolchain and sysroot for a raspberry pi.
>?
>Therefore, I call cmake with a script to configure my project. After that, I import the project into qtcreator.
>The problem is, that C and CXX compiler variables are not cached into cmake cache, so when importing the project, qtcreator calling cmake is not aware oft he >configured compiler.
>?
>My suggestion ist o use this patch. Is there any reason why the compilers are not cached?
>?
>?
>Best regards
>
>_______________________________________________ buildroot mailing list buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot

if you are trying to use Buildroot to generate a cross compiler, than you are using the wrong too, look for crosstool-ng

Dagg.
?
