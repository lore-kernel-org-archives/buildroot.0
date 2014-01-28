From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 28 Jan 2014 17:56:41 -0200
Subject: [Buildroot] [PATCH v2] fs/ubi: add option to use custom ubinize
 config file
In-Reply-To: <1379293447-1747-1-git-send-email-danomimanchego123@gmail.com>
References: <1379293447-1747-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAAEAJfDQY5ZMuz+GPxbP0tasJMyW=x++RZpSg0mPqGQRMkqGFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 September 2013 22:04, Danomi Manchego <danomimanchego123@gmail.com> wrote:
> By default, the UBI FS target creates a ubinize configuration
> file on-the-fly, for a single volume.  Add an option to specify
> a custom config file.
>
> E.g., one might want to deploy a system with a volume for the
> built ubifs image, a volume for a future upgrade image, and a
> volume for user data.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
