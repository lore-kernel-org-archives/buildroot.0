From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Jul 2015 11:49:50 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: create $(BUILD_DIR) before
 attempting to touch .root
In-Reply-To: <55A4DA8C.1030104@mind.be>
References: <1436867048-6333-1-git-send-email-patrickdepinguin@gmail.com>
 <55A4DA8C.1030104@mind.be>
Message-ID: <CAAXf6LXdavM=CW10T60ApsfpWNXktKQ-tnnTPYPpm71XwHV79A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 14, 2015 at 11:46 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/14/15 11:44, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>

Clearly, this will need to be ported to the skeleton-package patch...
