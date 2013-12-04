From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Dec 2013 07:19:55 -0300
Subject: [Buildroot] [PATCHv4] openssh: add systemd unit file
In-Reply-To: <CAHXCMM+NGxoPhjbeLFWdKB==bA0fDJH9qxVXdPvgarfBQnT7DA@mail.gmail.com>
References: <1384950476-12348-1-git-send-email-gustavo@zacarias.com.ar>
 <CAHXCMM+NGxoPhjbeLFWdKB==bA0fDJH9qxVXdPvgarfBQnT7DA@mail.gmail.com>
Message-ID: <529F01CB.7090309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/2013 07:08 AM, Samuel Martin wrote:
> Any specific reason to make sshd.service executable?

Inertia from looking at what the lightttpd package does (755 also).
But yes, that's wrong, i'll fix both.
Regards.
