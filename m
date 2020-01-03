From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 13:39:17 +0100
Subject: [Buildroot] [PATCH v2,2/2] package/samba4: drop host-python
In-Reply-To: <20200103112516.1501782-2-fontaine.fabrice@gmail.com>
References: <20200103112516.1501782-1-fontaine.fabrice@gmail.com>
 <20200103112516.1501782-2-fontaine.fabrice@gmail.com>
Message-ID: <20200103133917.6b413920@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 12:25:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop host-python to always build samba4 with host-python3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

What is the reasoning behind this change ? You don't explain *why* you
do this change.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
