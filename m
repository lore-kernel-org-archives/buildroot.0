From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 17:47:29 +0100
Subject: [Buildroot] : How to add a path to environment variable ?
In-Reply-To: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
References: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
Message-ID: <20210121174729.31850f5c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Jan 2021 16:32:56 +0100
manu f <e.fiancette@gmail.com> wrote:

> I create an overlay to install nodejs in usr/local/lib/nodejs

Why don't you use the nodejs package that Buildroot has ?

> and I need to add to the target environment varriable the path to the bin
> contain directory.
> How to do that ?

Add an extra file in /etc/profile.d/ to expand the PATH as needed. You
can use a root filesystem overlay to achieve this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
