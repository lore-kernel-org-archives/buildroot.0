From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 22 Sep 2016 11:28:30 +0200
Subject: [Buildroot] [RFC v2] mysql: replace mysql with mariadb 10.1
In-Reply-To: <20160922073305.68559e82@free-electrons.com>
References: <20160919034340.4233-1-bluemrp9@gmail.com>
 <20160919034340.4233-2-bluemrp9@gmail.com>
 <20160919074259.144cb649@free-electrons.com>
 <0fedb398-c688-9a22-a97c-c2f2da965f49@mind.be>
 <20160922073305.68559e82@free-electrons.com>
Message-ID: <98971763-e542-061d-0d85-6d9155648423@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09/22/2016 07:33 AM, Thomas Petazzoni wrote:
>
> Isn't part of the original idea of MariaDB to avoid the GPL-licensed
> client library so that proprietary applications can link with the
> client library without having to purchase a MySQL license?

The server distribution still uses the old GPL one for now.

There is a separate download called MariaDB connector/C that is a LGPL 
libmysqlclient replacement.
However that one wasn't really source code compatible with existing 
programs last time I tried to compile a couple buildroot packages 
against it.

Upstream bug: https://jira.mariadb.org/projects/CONC/issues/CONC-200


Yours sincerely,

Floris Bos
