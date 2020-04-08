From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:15:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump to version
 1.12.0
In-Reply-To: <20200407182307.508881-1-fontaine.fabrice@gmail.com>
References: <20200407182307.508881-1-fontaine.fabrice@gmail.com>
Message-ID: <20200408221526.274c5225@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  7 Apr 2020 20:23:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of LICENSE.txt: Fixed Apache license not using canonical
>   version:
>   https://github.com/google/flatbuffers/commit/9834ee97874c95eee8b27677639eeb33aed12980

This change is really weird. Instead of specifying a year and proper
copyright owner name, they've kept the:

   Copyright [yyyy] [name of copyright owner]

statement from the boilerplate license text. Weird.

> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Anyway, applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
