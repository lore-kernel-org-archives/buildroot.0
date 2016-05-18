From: Martin Kelly <martin@surround.io>
Date: Wed, 18 May 2016 15:16:17 -0700
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <573CE8F0.80200@surround.io>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
 <7e07c970-b00e-f605-7192-3152d53885e1@mind.be> <573CCB3C.1040703@surround.io>
 <2cb76318-9eb7-eacc-cdc3-e014604d2628@mind.be> <573CE8F0.80200@surround.io>
Message-ID: <573CE9B1.3030402@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/2016 03:13 PM, Martin Kelly wrote:
>
> I was working under the assumption that tabs count as 1 character. If
> tabs count as 8 characters instead, then the rest of the file is already
> miswrapped; there are many lines containing a tab, 2 spaces, and 70
> characters after.

Correction: "there are many lines containing a tab, 2 spaces, and 68 
characters after".
