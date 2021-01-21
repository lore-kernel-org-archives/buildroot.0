From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 20:47:41 +0100
Subject: [Buildroot] : How to add a path to environment variable ?
In-Reply-To: <CAGshWo2KMW3VvWSGeOvqqhvi3z-Onn_hdyA-4Yjb=YEKdUDuTw@mail.gmail.com>
References: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
 <20210121174729.31850f5c@windsurf.home>
 <CAGshWo2KMW3VvWSGeOvqqhvi3z-Onn_hdyA-4Yjb=YEKdUDuTw@mail.gmail.com>
Message-ID: <20210121204741.08247783@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jan 2021 18:02:39 +0100
manu f <e.fiancette@gmail.com> wrote:

> Thanks for your suggestion!
> in the last buildroot version, nodejs is deprecated!
> So I use my own compiled version of nodejs.

Deprecated ? We definitely still have a nodejs package, and it's not
deprecated at all.

> about etc/profile.d , I was just working on it, so its confirm this is the
> good way.
> But I was thinking there was a way to add natively the path ac buildroot
> compilation time. sorry I am newby.

In fact, you can also tweak the option BR2_SYSTEM_DEFAULT_PATH which
sets the default PATH value.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
