From: Simon Rowe <simon.rowe@eu.citrix.com>
Date: Mon, 25 Nov 2019 12:12:28 +0000
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
In-Reply-To: <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
 <20191123211555.GZ32494@scaer>
 <f361f14c-3a77-d769-1b5c-9a1a5fd8f3b3@eu.citrix.com>
Message-ID: <21733bbc-b084-3a1f-a678-29208a777cba@eu.citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/2019 09:23, Simon Rowe wrote:
> If the OS is buildroot and the container uses glibc that 
> doesn't work.

I meant to say "If buildroot uses musl and the container uses glibc ..."

Simon
