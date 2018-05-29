From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 08:52:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/ca-certificates: bump version
 to 20180409
In-Reply-To: <20180506161944.7451-2-martin@barkynet.com> (Martin Bark's
 message of "Sun, 6 May 2018 17:19:44 +0100")
References: <20180506161944.7451-1-martin@barkynet.com>
 <20180506161944.7451-2-martin@barkynet.com>
Message-ID: <876037uf5q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Update Mozilla certificate authority bundle to version 2.22.
 > The following certificate authorities were added (+):
 >   + "GDCA TrustAUTH R5 ROOT"
 >   + "SSL.com EV Root Certification Authority ECC"
 >   + "SSL.com EV Root Certification Authority RSA R2"
 >   + "SSL.com Root Certification Authority ECC"
 >   + "SSL.com Root Certification Authority RSA"
 >   + "TrustCor ECA-1"
 >   + "TrustCor RootCert CA-1"
 >   + "TrustCor RootCert CA-2"

 > The following certificate authorities were removed (-):
 >   - "ACEDICOM Root"
 >   - "AddTrust Low-Value Services Root"
 >   - "AddTrust Public Services Root"
 >   - "AddTrust Qualified Certificates Root"
 >   - "CA Disig Root R1"
 >   - "CNNIC ROOT"
 >   - "Camerfirma Chambers of Commerce Root"
 >   - "Camerfirma Global Chambersign Root"
 >   - "Certinomis - Autorit? Racine"
 >   - "Certum Root CA"
 >   - "China Internet Network Information Center EV Certificates Root"
 >   - "Comodo Secure Services root"
 >   - "Comodo Trusted Services root"
 >   - "DST ACES CA X6"
 >   - "GeoTrust Global CA 2"
 >   - "PSCProcert"
 >   - "Security Communication EV RootCA1"
 >   - "Swisscom Root CA 1"
 >   - "Swisscom Root CA 2"
 >   - "Swisscom Root EV CA 2"
 >   - "TURKTRUST Certificate Services Provider Root 2007"
 >   - "TUBITAK UEKAE Kok Sertifika Hizmet Saglayicisi - Surum 3"
 >   - "UTN USERFirst Hardware Root CA"

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
